import React from 'react'
import expect from 'expect'
import { actionBuilder, Actions } from '../app/actions'

describe('Actions: counter', () => {
    it('should exist and return payload', () => {
        let payload = { votes: 1 },
          action = {
            type: Actions.UPDATE_COUNTER,
            payload
          }
        expect(actionBuilder(Actions.UPDATE_COUNTER, payload)).toEqual(action)
    })
})