# Note: If the prices-array indicates an unrelenting downward progression, the program will output buy/sell dates of "nil". You just should skip the market!
def fast_stockpicker(prices)  
  # Phase 1
  results = convert_to_blocks(prices)
  blocks, max_val = results[0], results[1]  

  # Phase 2  
  # First check for the trivial cases
  if (blocks.count == 1) #Trivial case
    if (!blocks[0][0]) # Case of a single positive block
      return [0, prices.length - 1]
    else # Case of a single negative block  
      return [nil, nil]
    end
  end
  # If not trivial, we proceed to the normal algorithm
  
  #Step 0 
  trim(blocks)
  #Steps 1-3 on loop
  curr_end_idx = 0
  while (blocks.count > 1) # Step 1
    # Steps 2 & 3
    updates = query_endblock(blocks, curr_end_idx, max_val) 
    curr_end_idx, max_val = updates[0], updates[1]
  end
   
  return [blocks[0][2], blocks[0][3]] 
end


def trim(blocks)
  blocks.shift if (!blocks[0][0])
  blocks.pop  if (!blocks[-1][0])
end

def query_endblock(blocks, curr_end_idx, max_val)
  # Step 2
  if !(blocks[curr_end_idx][1] < max_val)  
    max_val = blocks[curr_end_idx][1]
    curr_end_idx += 1 # These 2 lines flip the index between 0 and -1
    curr_end_idx *= -1
  end 
  #Step 3
  reduce_end(blocks, curr_end_idx)
  
  return [curr_end_idx, max_val] 
end

def reduce_end(blocks, curr_end_idx)
  # Compare the end-block's magnitude with that of its negative neighbor
  if (curr_end_idx == 0)
    neighbor_idx = 1
  else
    neighbor_idx = -2
  end
  
  if (blocks[curr_end_idx][1] <= (-1 * blocks[neighbor_idx][1]))
    chop_end(blocks, curr_end_idx) # 3a
  else
    combine_end(blocks, curr_end_idx) #3b
  end
end

def chop_end(blocks, curr_end_idx)
  blocks.delete_at(curr_end_idx)
  blocks.delete_at(curr_end_idx)
end

def combine_end (blocks, curr_end_idx)
  b1 = blocks.delete_at(curr_end_idx)
  b2 = blocks.delete_at(curr_end_idx)
  b3 = blocks.delete_at(curr_end_idx)
  if (curr_end_idx == 0)
    combo_block = [true, b1[1] + b2[1] + b3[1], b1[2], b3[3]]
  else
    combo_block = [true, b1[1] + b2[1] + b3[1], b3[2], b1[3]]
  end
  blocks.insert(curr_end_idx, combo_block)
end


############ Phase 1
def convert_to_blocks(prices)
  blocks = []
  i = 0
  block = [nil, nil, nil, nil]
  max_gain = nil
  
  loop do
    diff = prices[i + 1] - prices[i] 
    curr_sign = (diff >= 0)
    
    if (block[0] == nil) #initialize the first block
      block = [curr_sign, diff, 0, 1]
      max_gain = diff
      
    elsif (block[0] == curr_sign)  #add to the current block, increment its end_index
      block[1] += diff
      block[3] += 1
      
    else #a new block is being encountered
      blocks << block
      
      if (block[1] > max_gain)
      max_gain = block[1]  
      end
      block = [curr_sign, diff, i , i + 1]
    end 
    
    i+= 1  
    if i == (prices.length - 1)
      blocks << block
      if (block[1] > max_gain)
      max_gain = block[1] 
      end
      break
    end
    
  end
  
  return [blocks, max_gain] 
end