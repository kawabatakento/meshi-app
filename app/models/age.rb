class Age < ActiveHash::Base
  self.data = [
    { id: 0, name: '10代' },
    { id: 1, name: '20代' },
    { id: 2, name: '30代' },
    { id: 3, name: '30代' },
    { id: 4, name: '壮年' },
    { id: 5, name: '老代' },
  ]
end
