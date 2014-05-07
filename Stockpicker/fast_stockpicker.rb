# Note: If the prices-array indicates an unrelenting downward progression, the program will output buy/sell dates of "nil". You just should skip the market in these cases!
def fast_stockpicker(prices)  
  # Phase 1
  results = convert_to_blocks(prices)
  blocks, max_val = results[0], results[1]  

  # Phase 2  
  # First check for the trivial cases
  if (blocks.count == 1) #Trivial case
    if (blocks[0][0] > 0) # Case of a single positive block
      return [0, prices.length - 1]
    else # Case of a single negative or zero block 
      puts "Don't play the market right now!"
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
   
  return [blocks[0][1], blocks[0][2]] 
end


def trim(blocks)
  blocks.shift if (blocks[0][0] < 0)
  blocks.pop  if (blocks[-1][0] < 0)
end

def query_endblock(blocks, curr_end_idx, max_val)
  # Step 2
  if !(blocks[curr_end_idx][0] < max_val)  
    max_val = blocks[curr_end_idx][0]
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
  
  if (blocks[curr_end_idx][0] <= (-1 * blocks[neighbor_idx][0]))
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
    combo_block = [b1[0] + b2[0] + b3[0], b1[1], b3[2]]
  else
    combo_block = [b1[0] + b2[0] + b3[0], b3[1], b1[2]]
  end
  blocks.insert(curr_end_idx, combo_block)
end


############ Phase 1
# Outputs the block chain and the max_value
# Assumes there are at least two prices in the prices-array
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
    else #a new block must created, old block added to block chain
      blocks << block
      block = [diff, i , i + 1]
    end 
        
    max_val = [max_val, block[0]].max #updates the max_val
    i+= 1  
    
    if i == (prices.length - 1)
      blocks << block #add final block to block chain
      break
    end
  end
  
  return [blocks, max_val] 
end