class List < ApplicationRecord
  # Refileを使うには、attachmentメゾットをモデルに追加する必要がある
  # attachmentメゾット：refileが指定のカラムにアクセスするのに必要
  attachment :image
end
