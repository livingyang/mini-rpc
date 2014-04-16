assert = require "assert"
should = require "should"
sinon = require "sinon"

MiniRpc = (require "../mini-rpc.coffee").MiniRpc

describe 'MiniRpc', ->
	rpc = new MiniRpc

	it 'test #pack', ->
		(JSON.stringify ["name"]).should.equal rpc.pack ["name"]
		(JSON.stringify ["name", "param0", "param1"]).should.equal rpc.pack ["name", "param0", "param1"]
	
	it 'test #unpack', ->
		["add", 1, 2].should.eql rpc.unpack rpc.pack ["add", 1, 2]

	it 'test #send', ->
		sendSpy = sinon.spy()
		rpc = new MiniRpc sendSpy

		noti = ["add", 1, 2]
		rpc.send noti...
		sendSpy.callCount.should.equal 1
		sendSpy.getCall(0).args[0].should.equal JSON.stringify noti

	it 'test #dispatch', ->
		handleSpy = sinon.spy()
		rpc = new MiniRpc handleSpy

		handleSpy.callCount.should.equal 0

		notiPack = rpc.pack ["add", 1, 2]
		rpc.register "add", handleSpy

		rpc.dispatch notiPack
		handleSpy.callCount.should.equal 1

		rpc.dispatch notiPack
		handleSpy.callCount.should.equal 2

		rpc.unregister "add", handleSpy
		rpc.dispatch notiPack

		handleSpy.callCount.should.equal 2

		handleSpy.getCall(0).args.should.eql [1, 2]