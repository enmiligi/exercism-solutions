defmodule DNA do
  alias ElixirSense.Providers.Suggestion.Reducers.Bitstring
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], bitstring) do
    bitstring
  end
  defp do_encode([nucleotide | rest], bitstring) do
    nucleotide_bitstring = <<encode_nucleotide(nucleotide)::size(4)>>
    bits = <<bitstring::bitstring, nucleotide_bitstring::bitstring>>
    do_encode(rest, bits)
  end

  def decode(dna) do
    Enum.reverse(do_decode(dna, ''))
  end

  defp do_decode(<<>>, charlist) do
    charlist
  end
  defp do_decode(<<value::4, rest::bitstring>>, charlist) do
    nucleotide_codepoint = decode_nucleotide(value)
    do_decode(rest, [nucleotide_codepoint | charlist])
  end
end
