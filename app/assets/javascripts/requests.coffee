bootstrap_treeview = require '../../../node_modules/bootstrap-treeview/src/js/bootstrap-treeview.js'

$(document).on 'turbolinks:load', ->
  id = $('#request').data('id')

  if id
    $.get "/requests/#{id}.json", (data) ->
      $('#request-tree').treeview
        data: [data],
        emptyIcon: 'fa'
        expandIcon: 'fa fa-plus'
        collapseIcon: 'fa fa-minus'
        onNodeSelected: (event, data) ->
          $('#response').html(data.description)
