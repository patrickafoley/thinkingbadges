'use strict'

# /* Filters */

angular.module("badgeFilters", []).filter "checkmark", ->
  (input) ->
    (if input then "✓" else "✘")
