import React from 'react'
import { shallow } from 'enzyme'
import expect from 'expect'
import HelloWorld from '../app/components/presenters/HelloWorld'

describe('Presenter component HelloWorld', () => {
    it('should render properly', () => {
        let comp = shallow(<HelloWorld name="world" />)
        expect(comp.html()).toEqual("<h1>HELLO WORLD</h1>")
    })
})