shared_examples_for "a class supporting dup for attributes" do |klass|

  subject do
    Class.new(klass) do
      attribute :attribute
    end.new
  end

  describe '#dup' do

    it 'returns an object with independent attributes' do
      subject.attribute = "foo"
      duped = subject.dup
      duped.attribute = "bar"

      subject.attribute.should == "foo"
      duped.attribute.should == "bar"
    end

    it 'does a deep copy' do
      subject.attribute = { :foo => "bar" }
      duped = subject.dup
      duped.attribute.merge!(:foo => "baz")

      subject.attribute.should == { :foo => "bar" }
      duped.attribute.should == { :foo => "baz" }
    end

  end

end
