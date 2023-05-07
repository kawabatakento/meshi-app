class Occupation < ActiveHash::Base
  self.data = [
    { id: 0, name: '村人' },
    { id: 1, name: 'かませ犬' },
    { id: 2, name: '商人' },
  ]
end