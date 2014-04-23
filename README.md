mini-rpc
========

mini-rpc is a simply json rpc for node/browser.

spec
----

	notification spec: `[name, params...]` name is required and must be string, params.length > 1

	# extend
	notification with id: `["id", 1, name, params...]`
	result of notification: `["result", id, result]`
	error of notification: `["error", id, error]`

example (peer to peer)
----------------------

	--> ["sayhello", "hello", "world"] # a notification, name:"sayhello", param[0]:"hello", param[1]:world

	--> ["id", "1", "add", 1, 2] # a notification with id
	<-- ["result", "1", 3] # a notification with id will return result

	--> ["id": "2", "add", 1]
	<-- ["error", "2", "add function miss param"] # error notificaion
