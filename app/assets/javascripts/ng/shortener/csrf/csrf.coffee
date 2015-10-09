(->
  config = ($httpProvider)->
    getToken = ->
      el = document.querySelector('meta[name="csrf-token"]')
      el = el.getAttribute('content')
      el

    updateToken = ->
      headers = $httpProvider.defaults.headers.common
      token = getToken()
      if token
        headers['X-CSRF-TOKEN'] = getToken
      return

    updateToken()
    return

  angular
    .module('ngCsrf')
    .config(config)
)()