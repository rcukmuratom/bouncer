module Bouncer
  ##
  # Rules to try before mappings because they are too important to let mappings
  # be used. This is a particular concern with mappings created automatically.
  class PreemptiveRules
    def self.redirect(location)
      [301, { "Location" => location }, []]
    end

    def self.try(context, _renderer)
      request = context.request

      case request.host
      when "www.environment-agency.gov.uk", "environment-agency.gov.uk"
        case request.non_canonicalised_fullpath
        when %r{^/homeandleisure/floods/riverlevels(/.*)?$}i
          redirect("http://apps.environment-agency.gov.uk/river-and-sea-levels#{Regexp.last_match(1)}")
        when %r{^/homeandleisure/floods/((cy/)?(34678|34681|147053)\.aspx(\?.*)?)$}i
          redirect("http://apps.environment-agency.gov.uk/flood/#{Regexp.last_match(1)}")
        end

      when "www.ofsted.gov.uk", "ofsted.gov.uk"
        case request.non_canonicalised_fullpath
        when %r{^/inspection-reports/find-inspection-report/provider/(.*)$}i
          redirect("http://reports.ofsted.gov.uk/inspection-reports/find-inspection-report/provider/#{Regexp.last_match(1)}")
        when %r{^/provider/files/(.*)/urn/(.*)$}i
          redirect("http://reports.ofsted.gov.uk/provider/files/#{Regexp.last_match(1)}/urn/#{Regexp.last_match(2)}")
        when %r{^/oxedu_providers/full/\(?urn\)?/([^/]*)/?(.*)$}i
          redirect("http://reports.ofsted.gov.uk/inspection-reports/find-inspection-report/provider/ELS/#{Regexp.last_match(1)}")
        when %r{^/oxcare_providers/full/\(?urn\)?/([^/]*)/?(.*)$}i
          redirect("http://reports.ofsted.gov.uk/inspection-reports/find-inspection-report/provider/CARE/#{Regexp.last_match(1)}")
        when %r{^/index.php\?q=filedownloading(.*)$}i
          redirect("http://reports.ofsted.gov.uk/index.php?q=filedownloading#{Regexp.last_match(1)}")
        end

      when "www.aaib.gov.uk", "aaib.gov.uk"
        case request.non_canonicalised_fullpath
        when %r{^/sites/aaib/(.*)$}i
          redirect("http://www.aaib.gov.uk/#{Regexp.last_match(1)}")
        end

      when "www.maib.gov.uk", "maib.gov.uk"
        case request.non_canonicalised_fullpath
        when %r{^/sites/maib/(.*)$}i
          redirect("http://www.maib.gov.uk/#{Regexp.last_match(1)}")
        end

      when "www.raib.gov.uk", "raib.gov.uk"
        case request.non_canonicalised_fullpath
        when %r{^/sites/raib/(.*)$}i
          redirect("http://www.raib.gov.uk/#{Regexp.last_match(1)}")
        end

      when "www.businesslink.gov.uk", "businesslink.gov.uk"
        case request.non_canonicalised_fullpath
        when %r{^(.*site=230.*)$}i
          redirect("http://business.wales.gov.uk#{Regexp.last_match(1)}")
        when %r{^(.*site=191.*)$}i
          redirect("http://www.nibusinessinfo.co.uk#{Regexp.last_match(1)}")
        end

      when "www.mcga.gov.uk", "mcga.gov.uk"
        case request.non_canonicalised_fullpath
        when %r{^/c4mca/(.*)$}
          redirect("http://www.dft.gov.uk/mca/#{Regexp.last_match(1)}")
        when %r{^/mca/(.*)$}
          redirect("http://www.dft.gov.uk/mca/#{Regexp.last_match(1)}")
        when %r{^/(.*)$}
          redirect("http://www.dft.gov.uk/mca/#{Regexp.last_match(1)}")
        end

      when "www.planningportal.gov.uk", "planningportal.gov.uk"
        case request.non_canonicalised_fullpath
        when %r{^/wps/portal/portalhome/unauthenticatedhome/!ut/}
          redirect("http://www.planningportal.gov.uk")
        end
      end
    end
  end
end
