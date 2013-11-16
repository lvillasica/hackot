window.Events = {

	template: ' \
		<div class="announcement span5"> \
		  <div class="header"> \
		    <h5>Title</h5> \
		    <small class="title"></small> \
		  </div> \
		  <div class="header"> \
		    <small><strong>Required</strong></small> <span class="required badge badge-info"></span> \
		    <small><em>Actual</em></small> <span class="actual badge badge-important"></span> \
		  </div> \
		  <div class="details"></div> \
		</div> \
	',

	list: function() {
		var el = $(this.template),
				elClone = null,
				container = $('#events'),
				events = [],
				_this = this;

		$.get('/events', function(collection) {
			events = collection.events;
			elClone = el.clone();
			_.each(events, function(evt) {
				elClone.data('id', evt.id);
				elClone.find('.title').text(evt.title);
				elClone.find('.required').text(evt.required);
				elClone.find('.actual').text(evt.actual);
				elClone.find('.details').text(evt.details);
				container.append(elClone);
			});
		});
	}

}