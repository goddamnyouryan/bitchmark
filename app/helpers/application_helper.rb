module ApplicationHelper
  def bookmarklet_js
    code = <<-eos
      javascript:
        (function(){
          if (window.Bitchmark!==undefined) {
            new Bitchmark.Views.Bookmarklet({el: 'body', hashId: '#{params[:hash_id]}'});
          } else {
            var stylesheet = document.createElement('link');
            stylesheet.setAttribute('rel', 'stylesheet');
            stylesheet.setAttribute('type', 'text/css');
            stylesheet.setAttribute('href', '#{bookmarklet_css_path}');
            document.body.appendChild(stylesheet);
            var script = document.createElement('script');
            script.setAttribute('type','text/javascript');
            script.setAttribute('src', '#{bookmarklet_path}');
            document.body.appendChild(script);
            script.onload = script.onreadystatechange = function() {
              var rs = script.readyState;
              if (!rs || rs === 'loaded' || rs === 'complete') {
                script.onload = script.onreadystatechange = null;
                new Bitchmark.Views.Bookmarklet({el: 'body', hashId: '#{params[:hash_id]}'});
              }
            };
          }
        })();
    eos
    raw(code.squish)
  end

  def bookmarklet_path
    env = Rails.env.production? ? 'production' : 'development'
    path = javascript_path("bookmarklet_#{env}")
    remove_fingerprint "//#{request.env['HTTP_HOST']}#{path}", '.js'
  end

  def bookmarklet_css_path
    remove_fingerprint "//#{request.env['HTTP_HOST']}#{stylesheet_path('bookmarklet')}", '.css'
  end

  def remove_fingerprint(url, extension)
    url.split(/-|.css|.js/)[0] + extension
  end
end
