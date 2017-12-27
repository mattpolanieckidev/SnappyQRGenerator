class QrCodesController < ApplicationController
  def new
  end

  def create
    
    @qr = RQRCode::QRCode.new(qr_code_params[:text], size: 4)
# With default options specified explicitly
png = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 120,
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
          )
IO.write("/tmp/github-qrcode.png", png.to_s)
    
  end

private
  def qr_code_params
    params.require(:qr_code).permit(:text)
  end
end
