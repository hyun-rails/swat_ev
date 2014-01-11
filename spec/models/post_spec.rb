require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(department: "Econonmics", professor:"professor", 
    	       course:"Econ 101", content: "Lorem ipsum", user_id: user.id) }

  subject { @post }

  it { should respond_to(:department) }
  it { should respond_to(:professor) }
  it { should respond_to(:course) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

end