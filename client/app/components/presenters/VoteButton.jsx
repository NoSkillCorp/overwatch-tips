import React from 'react'

const classNames = require('classnames')

const TYPE = {
  PLUS: 1,
  MINUS: -1
}

const VoteButton = ({ type, active, onButtonClick }) => { 
  let isPlus = TYPE.PLUS === parseInt(type),
    isMinus = TYPE.MINUS === parseInt(type)
  let aClass = classNames({
    "upvote_tip btn btn-sm": true,
    "btn-default": !active,
    "btn-success": active && isPlus,
    "btn-danger": active && isMinus
  })
  let iClass = classNames({
    "fa": true,
    "fa-plus": isPlus,
    "fa-minus": isMinus
  })
  return (
    <a className={aClass} onClick={onButtonClick}>
      <i className={iClass} aria-hidden="true" />
    </a>
  )
}
export default VoteButton