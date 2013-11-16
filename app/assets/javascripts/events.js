window.Events = {

	templates: {
		itemEvent: ' \
			<div class="announcement span5"> \
			  <div class="header"> \
			    <h5 class="title"></h5> \
			  </div> \
			  <div class="header"> \
			    <small><strong>Required</strong></small> <span class="required badge badge-info"></span> \
			    <small><em>Actual</em></small> <span class="actual badge badge-important"></span> \
			  </div> \
			  <div class="details"></div> \
			</div> \
		',

    rcItemEvent: ' \
      <tr> \
        <td class="date"></td> \
        <td class="title"></td> \
        <td> \
          <a href="#" class="btn">Edit</a> \
          <a href="#" class="btn btn-danger">Cancel</a> \
        </td> \
      </tr> \
    '
	},

	container: $('#events'),

	events: [],

	list: function() {
		var el = $(this.templates.itemEvent),
				elClone = null,
				_this = this;

		$.get('/events', function(collection) {
			_this.events = collection.events;
			elClone = el.clone();
			_.each(_this.events, function(evt) {
				elClone.data('id', evt.id);
				elClone.find('.title').text(evt.title);
				elClone.find('.required').text(evt.required);
				elClone.find('.actual').text(evt.actual);
				if(evt.details === null) {
					elClone.find('.details').html("<i>No details.</i>");
				}else{
					elClone.find('.details').text(evt.details);
				}
				_this.container.append(elClone);
			});

			_this.noData(_this.container);
		});
	},

	noData: function(container, htmlMsg) {
		if(typeof htmlMsg === 'undefined') htmlMsg = '<p class="nodata">No events found.</p>';
		if(this.events.length === 0) {
			container.html(htmlMsg);
		}
	},

	listRCEvents: function(reliefCenterID) {
		var el = $(this.templates.rcItemEvent),
				elClone = null,
				_this = this;

		$.get('/relief_centers/' + reliefCenterID + '/events', function(collection) {
			events = collection.events;
			elClone = el.clone();
			_.each(this.events, function(evt) {
				elClone.data('id', evt.id);
				elClone.find('.date').text(evt.date);
				elClone.find('.title').text(evt.title);
				_this.container.find('tbody').append(elClone);
			});

			_this.noData(_this.container.find('tbody'), '<tr class="nodata"><td colspan="3">No events found.</td></tr>');
		});
	}

}