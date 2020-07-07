FactoryBot.define do
  factory :image do
    # image {item.image.attach ( File.open("fixtures/sample.jpg") )}
    # item.image.attach(io: File.open("fixtures/sample.jpg"))
    subject { create(:item).image }
    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end
end
