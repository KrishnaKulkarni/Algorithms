def convert_to_blocks(prices)
  blocks = []
  i = 0
  block = [nil, 0, 1]
  max_val = 0
  
  loop do
    diff = prices[i + 1] - prices[i] 

    if (block[0] == nil) #initialize the first block
      block[0] = diff  
    # check whether the signs match
    # if so, add to the current block  
    elsif (block[0] * diff >= 0) 
      block[0] += diff
      block[2] += 1
    else #a new block must created, old block added 
      blocks << block
      block = [diff, i , i + 1]
    end 
        
    max_val = [max_val, block[0]].max
    i+= 1  
    
    if i == (prices.length - 1)
      blocks << block
      break
    end
  end
  
  return [blocks, max_val] 
end