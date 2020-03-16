require 'rails_helper'

RSpec.describe Messagexx, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with content' do
        expect(build(:message, image: nil)).to be_valid
      end

      it 'is valid with image' do
        expect(build(:message, content: nil)).to be_valid
      end

      it 'is valid with content and image' do
        expect(build(:message)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without content and image' do
        messagexx = build(:message, content: nil, image: nil)
        messagexx.valid?
        expect(messagexx.errors[:content]).to include("を入力してください")
      end

      it 'is invalid without group_id' do
        messagexx = build(:message, group_id: nil)
        messagexx.valid?
        expect(messagexx.errors[:group]).to include("を入力してください")
      end

      it 'is invaid without account_id' do
        message = build(:message, account_id: nil)
        message.valid?
        expect(message.errors[:account]).to include("を入力してください")
      end
    end
  end
end