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
      <tr class="event"> \
        <td class="date"></td> \
        <td class="title"></td> \
        <td class="count"></td> \
        <td> \
          <a href="#" class="btn edit-btn">Edit</a> \
          <a href="#" class="btn btn-danger cancel-btn">Cancel</a> \
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
			_this.events = collection.events;
      _this.container.find("tr.nodata").remove();
			_.each(_this.events, function(evt) {
        elClone = el.clone();
        elClone.data('id', evt.id);
				elClone.find(".date").text(evt.formatted_time);
        elClone.find(".title").text(evt.title);
        elClone.find(".count").text(evt.volunteers_needed);
        console.log(evt);
        console.log(elClone);
				_this.container.find('tbody').append(elClone);
			});

			_this.noData(_this.container.find('tbody'), '<tr class="nodata"><td colspan="3">No events found.</td></tr>');
		});

    return _this;
	},

  listenEvents: function() {
    var _this = this;
    $("#eventForm").submit(function(evt) {
      evt.preventDefault();
      _this.submitForm($(this));
    });

    $('#events').on('click', '.event', function(e) {
    	e.preventDefault();
    	window.location = '/events/' + $(e.currentTarget).data('id') + '/users'
    });
  },

  submitForm: function(form) {
    var _this = this,
        $el = $(_this.templates.rcItemEvent);

    $.post(form.attr('action'), form.serialize(), function(data) {
      if(data.error) {
        alert(data.error.join("\n"));
      } else {
      	$el.data('id', evt.id);
        $el.find(".date").text(data.formatted_time);
        $el.find(".title").text(data.title);
        $el.find(".count").text(data.volunteers_needed);
        _this.container.find("tr.nodata").remove();
        _this.container.find("tbody").append($el);
      };
    });
  }

}