list(
  new = function(val) function() list(value = val),
  newWithSelf = function(f) function() list(value = f(list(value = NULL))),
  read = function(ref) function() ref$value,
  modifyImpl = function(f) {
    function(ref) {
      function() {
        t <- f(ref$value)
        ref$value <- t$state
        t$value
      }
    }
  },
  write = function(val) function(ref) function() ref$value <- val
)
