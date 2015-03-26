$ ->
  $(document).on "click", ".next-button", ->
    index = parseInt($(@).attr("data-index"))
    $("#word-#{index}").addClass("hidden")
    $("#word-#{index + 1}").removeClass("hidden")

