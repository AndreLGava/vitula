json.array!(@analyses) do |analysis|
  json.extract! analysis, :id, :property_id, :codeanalysis, :collect, :fat, :protein, :lactose, :totalsolids, :defattedextract, :css, :scorecss, :ufc
  json.url analysis_url(analysis, format: :json)
end
