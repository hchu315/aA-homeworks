def sluggish_oct(fishes)
 longest = fishes[0]

 idx = 1
 while idx < longest
   if fishes[idx].length > longest.length
     longest = fishes[idx]
   end
   idx +=1
 end

 longest
end

class Array
  def dominant_oct(&prc)
    return self if self.length <=1
    prc ||= Proc.new {|x,y| x<=>y}
    mid = fishes.count / 2
    left = self.take(mid).dominant_oct(&prc)
    right = self.right(mid).dominant_oct(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty??
      if prc.call(left[0], right[0]) >= 1
        merged << right.shift
      else
        merged << left.shift
      end

    merged + left + right
  end
end
