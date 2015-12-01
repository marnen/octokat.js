toQueryString = require './helper-querystring'

module.exports =
  verbs:
    fetch     : (path, query) -> {method:'GET', path:"#{path}#{toQueryString(query)}"}
    read      : (path, query) -> {method:'GET', path:"#{path}#{toQueryString(query)}", options:{isRaw:true}}
    readBinary: (path, query) -> {method:'GET', path:"#{path}#{toQueryString(query)}", options:{isRaw:true, isBase64:true}}
    remove    : (path, data) ->   {method:'DELETE', path, data, options:{isBoolean:true}}
    create    : (path, data, isRaw) -> {method:'POST', path, data, options:{isRaw}}
    update    : (path, data) ->   {method:'PATCH', path, data}
    add       : (path, data) ->   {method:'PUT', path, data, options:{isBoolean:true}}
    contains  : (path, args...) -> {method:'GET', path:"#{path}/#{args.join('/')}", options:{isBoolean:true}}
