Shindo.tests('Fog::Rackspace::AutoScale | group_tests', ['rackspace', 'rackspace_autoscale']) do
	
	pending if Fog.mocking? 
	service = Fog::Rackspace::AutoScale.new :rackspace_region => :ord
  
  @launch_config = begin 
    Fog::Rackspace::AutoScale::LaunchConfig.new({
      :service => @service,
      :group   => self
    }).merge_attributes(LAUNCH_CONFIG_OPTIONS) 
  end

  @group_config = begin 
    Fog::Rackspace::AutoScale::GroupConfig.new({
      :service => @service,
      :group   => self
    }).merge_attributes(GROUP_CONFIG_OPTIONS) 
  end

	tests('success') do
		tests('#create new group').formats(GROUP_FORMAT) do
			response = service.create_group(@launch_config, @group_config, POLICIES_OPTIONS).body
      @group_id = response['group']['id']
			response
		end
    tests('#get group').formats(GET_GROUP_HEADERS_FORMAT) do
      service.get_group(@group_id).data[:headers]
    end
    tests('#delete group').formats(GROUP_DELETE_DATA_FORMAT) do
      service.delete_group(@group_id).data
    end
	end

	tests('failure') do
    tests('#fail to create group(-1)').raises(Fog::Rackspace::AutoScale::BadRequest) do
      service.create_group(@launch_config, @group_config, {})
    end
    tests('#fail to get group(-1)').raises(Fog::Rackspace::AutoScale::NotFound) do
      service.get_group(-1)
    end
    tests('#update group').raises(NoMethodError) do
      service.update_group
    end
    tests('#fail to delete group(-1)').raises(Fog::Rackspace::AutoScale::NotFound) do
      service.delete_group(-1)
    end
	end

end