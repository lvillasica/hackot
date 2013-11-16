window.ReliefCenters = {

  templates: {
    reliefCenter: ' \
      <div class="rc"> \
        <span class="name">DSWD</span> \
        <span class="badge badge-success pull-right events-count"></span> \
      </div> \
    ',

    rcEvent: ' \
      <tr> \
        <td>11/16/13</td> \
        <td>Title here</td> \
        <td> \
          <a href="#" class="btn">Edit</a> \
          <a href="#" class="btn btn-danger">Cancel</a> \
        </td> \
      </tr> \
    '
  },

  container: $("#reliefCenters"),

  listenEvents: function() {
    var _this = this;
    $("#eventForm").submit(function(evt) {
      evt.preventDefault();
      _this.submitForm();
    });
  },

  list: function() {
    var el = $(this.templates.reliefCenter),
        elClone = null,
        reliefCenters = [],
        _this = this;

    $.get('/relief_centers', function(collection) {
      centers = collection.relief_centers;
      elClone = el.clone();
      _.each(centers, function(center) {
        elClone.data('id', center.id)
        elClone.find(".name").text(center.name);
        elClone.find(".events-count").text(center.events_count);
        _this.container.append(elClone);
      });

      if(centers.length == 0) {
        _this.noData();
      }
    });
  },

  submitForm: function() {
    // submit form
    // edit once update event comes
  },

  noData: function() {
    this.container.html('No relief centers found.');
  }
}