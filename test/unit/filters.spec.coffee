'use strict'
describe 'filters', ->
  beforeEach module('app')

  describe 'capitalize', ->
    it 'should capitalize a string', inject((capitalizeFilter) ->
      expect(capitalizeFilter('hey')).toBe 'Hey'
    )
