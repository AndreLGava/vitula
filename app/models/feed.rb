class Feed < ActiveRecord::Base
	enum kind: {aditivos: 1, sal: 2, aleitamento: 3, volumoso: 4, concentrado: 5}
end
