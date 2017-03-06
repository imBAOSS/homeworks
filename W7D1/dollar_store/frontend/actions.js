const selectCurrency = (baseCurrency, rates) => ({
  type: "SWITCH_CURRENCY",
  baseCurrency,
  rates
});

window.selectCurrency = selectCurrency;

export default selectCurrency;
