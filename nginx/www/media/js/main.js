function updateStreamStatus() {
  $.ajax({
    url: '/status.json',
    method: 'GET',
    dataType: 'json',
    success: function(data) {
      // Parse the JSON data
      var jsonData = data;

      // Check the value of the status property
      if (jsonData.status === 'offline') {

        document.getElementById("status").className = "not_live";
        $('#status').html('No one is currently streaming');
        document.title = 'TiNiStRiMi - offline';

        document.getElementById("watch_link").href = "/stream/";
        $('#watch_link').html(' ');

        $('#sub_text').html(' ');

      } else if (jsonData.status === 'online') {

        document.getElementById("status").className = "live";
        $('#status').html('Live right now!');
        document.title = 'TiNiStRiMi - Live right now!';
        $('#watch_link').html('Watch');

        if (jsonData.type === 'webrtcSession') {

          document.getElementById("watch_link").href = "/stream/";
          $('#sub_text').html('Link above not working? Try <a href="/hls_stream/">LLHLS</a>');

        } else if (jsonData.type === 'rtmpConn') {

          document.getElementById("watch_link").href = "/hls_stream/";
          $('#sub_text').html('With VLC, Ctrl+N rtmp://' + window.location.hostname + '/stream');
            
        }
      }
    },
    error: function(xhr, status, error) {
      console.error('Failed to fetch stream status:', error); // Log any AJAX request errors
    }
  });
}

$(document).ready( function() {
  updateStreamStatus();
  setInterval(updateStreamStatus, 1000);
})
