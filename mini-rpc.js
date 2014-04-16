// Generated by CoffeeScript 1.7.1
(function() {
  var __slice = [].slice;

  this.MiniRpc = (function() {
    function MiniRpc(_send) {
      this._send = _send;
      this._handleMap = {};
    }

    MiniRpc.prototype.pack = function(paramArray) {
      return JSON.stringify(paramArray);
    };

    MiniRpc.prototype.unpack = function(pack) {
      var result;
      if ((result = JSON.parse(pack)) instanceof Array) {
        return result;
      } else {
        return [];
      }
    };

    MiniRpc.prototype.send = function() {
      var name, params;
      name = arguments[0], params = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return this._send(this.pack([name].concat(__slice.call(params))));
    };

    MiniRpc.prototype.dispatch = function(pack) {
      var method, params, _base, _ref;
      _ref = this.unpack(pack), method = _ref[0], params = 2 <= _ref.length ? __slice.call(_ref, 1) : [];
      return typeof (_base = this._handleMap)[method] === "function" ? _base[method].apply(_base, params) : void 0;
    };

    MiniRpc.prototype.register = function(name, handle) {
      return this._handleMap[name] = handle;
    };

    MiniRpc.prototype.unregister = function(name, handle) {
      return this._handleMap[name] = null;
    };

    return MiniRpc;

  })();

}).call(this);
