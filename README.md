mini-rpc
========

mini-rpc is a simply json rpc for node/browser.

spec
----

* notification spec: `[name, params...]` name is required and must be string, params.length > 1

* notification with id: `{id: notification}`

example (peer to peer)
----------------------

	--> ["sayhello", "hello", "world"] # a notification, name:"sayhello", param[0]:"hello", param[1]:world

	--> {"1": ["add", 1, 2]} # a notification with id
	<-- {"id": 1, "result": 3, "error": null} # a notification with id will return result

	--> {"2": ["errorFunc", "username", "session"]}
	<-- {"id": 2, "result": null, "error": "unfound function"} # error notificaion
