GOOGLE_APPS_CONFIG = YAML.load_file("#{Rails.root}/config/google_apps.yml")[Rails.env]

require 'provisioning-api'
include GAppsProvisioning
def google_apps_connection
  @google_apps_connection ||= ProvisioningApi.new(GOOGLE_APPS_CONFIG['username'], 
GOOGLE_APPS_CONFIG['password'])
rescue
  Rails.logger.debug "had to rescue (ie reconnect) google apps"
  @google_apps_connection = ProvisioningApi.new(GOOGLE_APPS_CONFIG['username'], 
GOOGLE_APPS_CONFIG['password'])
end