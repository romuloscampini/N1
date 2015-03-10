React = require 'react'
{Actions, Utils} = require 'inbox-exports'
{RetinaImg} = require 'ui-components'

module.exports =
AccountSidebarTagItem = React.createClass
  render: ->
    unread = []
    if @props.tag.unreadCount > 0
      unread = <div className="unread item-count-box">{@props.tag.unreadCount}</div>

    classSet =  React.addons.classSet
      'item': true
      'item-tag': true
      'selected': @props.select

    <div className={classSet} onClick={@_onClick} id={@props.tag.id}>
      {unread}
      <RetinaImg name={"#{@props.tag.id}.png"} fallback={'folder.png'} selected={@props.select}/>
      <span className="name"> {@props.tag.name}</span>
    </div>

  _onClick: (event) ->
    event.preventDefault()

    if @props.tag.id is 'drafts'
      Actions.selectView('drafts')
    else
      Actions.selectView('threads')
    Actions.selectTagId(@props.tag.id)
