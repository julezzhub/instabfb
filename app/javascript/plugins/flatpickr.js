import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import "flatpickr/dist/themes/dark.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


flatpickr("#range_start", {
  allowInput: true,
  altInput: true,
  plugins: [new rangePlugin({ input: "#range_end"})]
})
