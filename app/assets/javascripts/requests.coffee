bootstrap_treeview = require '../../../node_modules/bootstrap-treeview/src/js/bootstrap-treeview.js'

request_data = ->
  [
    {
      text: "Parent 1",
      nodes: [
        {
          text: "Child 1",
          nodes: [
            {
              text: "Grandchild 1"
            },
            {
              text: "Grandchild 2"
            }
          ]
        },
        {
          text: "Child 2"
        }
      ]
    }
  ]

ready = ->
  id = $('#request').data('id')
  $.get "/requests/#{id}.json", (data) ->
    $('#request-tree').treeview
      data: [data],
      emptyIcon: 'fa'
      expandIcon: 'fa fa-plus'
      collapseIcon: 'fa fa-minus'
      onNodeSelected: (event, data) ->
        $('#response').html(data.text)

$(document).ready(ready)
$(document).on('page:load', ready)
