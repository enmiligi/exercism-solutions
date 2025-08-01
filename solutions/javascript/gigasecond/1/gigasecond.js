export const gigasecond = (date) => {
  let copy_date = new Date(date);
  copy_date.setSeconds(date.getSeconds() + 1000000000);
  return copy_date;
};
