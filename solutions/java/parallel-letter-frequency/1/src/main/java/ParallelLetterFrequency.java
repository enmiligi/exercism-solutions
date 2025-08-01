import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


class ParallelLetterFrequency {
    ParallelLetterFrequencyState state;

    private static class ParallelLetterFrequencyState {
        Map<Character, Integer> frequencies;
        ParallelLetterFrequencyState() {
            frequencies = new HashMap<>();
        }

        synchronized void SubmitFrequencies(Map<Character, Integer> fs) {
            for (var entry : fs.entrySet()) {
                frequencies.put(entry.getKey(), frequencies.getOrDefault(entry.getKey(), 0) + entry.getValue());
            }
        }
    }

    private static class ParallelLetterFrequencyWorker implements Runnable {
        String text;
        Map<Character, Integer> frequencies;
        ParallelLetterFrequencyState state;
        CountDownLatch latch;

        ParallelLetterFrequencyWorker(String text, ParallelLetterFrequencyState state, CountDownLatch latch) {
            this.text = text;
            this.frequencies = new HashMap<>();
            this.state = state;
            this.latch = latch;
        }

        @Override
        public void run() {
            for (char c : text.toCharArray()) {
                if (Character.isLetter(c)) {
                    frequencies.put(Character.toLowerCase(c), frequencies.getOrDefault(Character.toLowerCase(c), 0) + 1);
                }
            }
            state.SubmitFrequencies(frequencies);
            latch.countDown();
        }
    }

    ParallelLetterFrequency(String[] texts) {
        state = new ParallelLetterFrequencyState();
        var latch = new CountDownLatch(texts.length);
        try (ExecutorService threadPool = Executors.newFixedThreadPool(10)) {
            for (String text : texts) {
                threadPool.submit(new ParallelLetterFrequencyWorker(text, state, latch));
            }
            latch.await();
        } catch (InterruptedException ignored) {}
    }

    Map<Character, Integer> countLetters() {
        return state.frequencies;
    }

}
