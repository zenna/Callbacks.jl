"Callback Node"
struct CbNode{F, TPL <: Tuple}
  parent::F
  children::TPL
end

p → c::Tuple = CbNode(p, c)
p → c = CbNode(p, (c,))

datamerge(x, data) = nothing
datamerge(data1::NamedTuple, data2::NamedTuple) = merge(data1, data2)

trigger(data, child, stage) = nothing
trigger(data::NamedTuple, child, stage) = child(data, stage)

function (cbt::CbNode)(data, stage)
  data2 = datamerge(cbt.parent(data, stage), data)
  for child in cbt.children
    trigger(data2, child, stage)
  end
end