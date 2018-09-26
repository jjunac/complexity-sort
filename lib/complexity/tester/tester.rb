class Tester
  NUMBER_MAX = 1000
  REPEAT = 1000
  MAX_LEN = 16

  def initialize
  end

  def execute(sort_algorithm)
    for n in 1..MAX_LEN
      array = generate_random(2 ** n)
      for i in 0...REPEAT
        start = Time.now
        sort_algorithm array
        diff = Time.now - start
      end
    end
  end

  def generate_random(size)
    (0...size).map(rand(NUMBER_MAX))
  end
end