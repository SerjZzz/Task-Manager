class Api::V1::ApplicationController < Api::ApplicationController
  RANSACK_DEFAULT_SORT = 'created_at DESC'.freeze

  def self.responder
    JsonResponder
  end

  def build_meta(collection)
    {
      count: collection.count,
      total_count: collection.total_count,
      current_page: collection.current_page,
      total_pages: collection.total_pages,
      per_page: collection.limit_value,
    }
  end

  def ransack_params
    { s: RANSACK_DEFAULT_SORT }.merge(params.to_unsafe_h.fetch(:q, {}))
  end

  def page
    params.fetch(:page, 1)
  end

  def per_page
    per = params.fetch(:per_page, 10).to_i
    per > 100 ? 100 : per
  end
end
