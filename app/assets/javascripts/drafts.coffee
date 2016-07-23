$(document).on "turbolinks:load", ->
  # update the team selector on change
  $('select.team-toggle').change ->
    target = $(this).data('target')
    show = $("option:selected", this).val()
    $(target).children().addClass('hide')
    team = 'table[data-team="team_' + show + '"]'
    $(team).removeClass('hide')
