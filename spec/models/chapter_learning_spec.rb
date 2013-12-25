require 'spec_helper'

describe ChapterLearning do
  subject{ FactoryGirl.create :chapter_learning }

  include_examples 'auto create child learning objects', :unit_learnings, :for => :unit, :parent => :chapter

  describe '#open?' do
    context 'first chapter learning' do
      before{ subject.chapter.move_to_top }
      its(:open?){ should be_true}
    end

    context 'non-first chapter learning' do
      before do
        @the_chapter = subject.chapter
        @topic = FactoryGirl.create :topic
        @topic.chapters << [@the_chapter, FactoryGirl.create(:chapter)]
        @the_chapter.move_to_bottom
      end

      context 'the one in front of it is passed' do
        before{ pending }
        its(:open?){ should be_true }
      end

      context 'the one in front of it is not passed' do
        before{ pending }
        its(:open?){ should be_false }
      end
    end
  end

end
