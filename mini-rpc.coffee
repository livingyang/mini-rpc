class @MiniRpc
	constructor: (@_send) ->
		@_handleMap = {}

	pack: (paramArray) ->
		JSON.stringify paramArray

	unpack: (pack) ->
		if (result = JSON.parse pack) instanceof Array then result else []

	send: (name, params...) ->
		@_send @pack [name, params...]

	dispatch: (pack) ->
		[method, params...] = @unpack pack
		@_handleMap[method]? params...

	register: (name, handle) ->
		@_handleMap[name] = handle

	unregister: (name, handle) ->
		@_handleMap[name] = null
