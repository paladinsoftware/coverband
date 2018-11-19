require File.expand_path('../test_helper', File.dirname(__FILE__))
require 'aws-sdk-s3'

module Coverband
  class S3ReportWriterTest < Test::Unit::TestCase
    def html_version
      Gem::Specification.find_by_name('simplecov-html').version.version
    rescue StandardError
      '0.10.2'
    end

    test 'it writes the coverage report to s3' do
      s3 = mock('s3_resource')
      s3_client = mock('s3_client')
      bucket = mock('bucket')
      object = mock('object')
      s3.expects(:bucket).with('coverage-bucket').returns(bucket)
      bucket.expects(:object).with('test-prefix/coverband/index.html').returns(object)
      File.expects(:read).at_least(0).returns("content ./assets/#{html_version}/")
      object.expects(:put).with(body: 'content ')
      Aws::S3::Resource.expects(:new).returns(s3)
      Aws::S3::Client.expects(:new).returns(s3_client)

      s3_writer_options = {
        bucket_prefix: 'test-prefix/',
        region: 'us-west-1',
        access_key_id: '',
        secret_access_key: ''
      }
      Coverband::Utils::S3ReportWriter.new('coverage-bucket', s3_writer_options).persist!
    end
  end
end
