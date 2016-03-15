bootstrap_treeview = require '../../../node_modules/bootstrap-treeview/src/js/bootstrap-treeview.js'

ready = ->
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

$(document).ready(ready)
$(document).on('page:load', ready)
