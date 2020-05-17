jQuery(function($) {
	$('.modal-pr').click(function(e) {
    e.preventDefault();
    var data = $(this).attr('data-session');
    var details = $.parseJSON(data);
    var modal = GenerateModal(details);

    $('#modal-portfolio').remove();
    $('#modal-details').append(modal);
    $('#modal-portfolio').modal('toggle');
    // $(`.swipebox_${details['id']}`).swipebox();
	});

  // generate modal
  function GenerateModal(data) {
    var modal = `<div class="modal fade" id="modal-portfolio" role="dialog">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">${data["name"]}</h4>
          </div>
          <div class="modal-body modal-body-portfolio">
            <table class="table table-bordered">
              <tbody>
                <tr>
                  <th>Architect</th>
                  <td>${data["architect"]}</td>
                </tr>
                <tr>
                  <th>Location</th>
                  <td>${data["location"]}</td>
                </tr>
                <tr>
                  <th>Area</th>
                  <td>${data["area"]}</td>
                </tr>
                <tr>
                  <th>Photographs</th>
                  <td>${data["photographs"]}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <a href="/details?portfolio_id=${data['id']}" class="btn btn-primary" target="_blank">Details</a>
          </div>
        </div>
      </div>
    </div>`;
    return modal;
  }
});
