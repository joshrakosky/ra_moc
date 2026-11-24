'use client'

import { useRouter } from 'next/navigation'
import ExportOrdersButton from '@/components/ExportOrdersButton'
import HelpIcon from '@/components/HelpIcon'
import { useRequireEmail } from '@/lib/use-require-email'

export default function InstructionsPage() {
  const router = useRouter()
  const { email, ready } = useRequireEmail()

  if (!ready || !email) {
    return (
      <div className="flex min-h-screen items-center justify-center">
        <p className="text-xl text-white">Loading...</p>
      </div>
    )
  }

  return (
    <div className="relative flex min-h-screen items-center justify-center px-3 py-14 sm:px-4 sm:py-10">
      <ExportOrdersButton />
      <HelpIcon />

      <div className="relative z-10 w-full max-w-2xl rounded-lg bg-white p-5 shadow-lg sm:p-8 md:p-10">
        <h1 className="mb-4 text-2xl font-bold text-gray-900">
          Welcome to the Republic Airways MOC Appreciation Gift Redemption Site!
        </h1>

        {/* MOC program rules: one cobranded design, one ship-to, one item. */}
        <ul className="mb-8 list-disc space-y-3 pl-5 text-gray-700">
          <li>
            All items feature the cobranded <strong>Republic x MOC</strong> design.
          </li>
          <li>There are various options you can choose from in different item colors and/or sizes.</li>
          <li>
            You may only select <strong>one</strong> item to redeem in this program.
          </li>
          <li>
            If a particular size/color/etc. is not offered, you will either not see that color selection, or
            see the option as greyed-out.
          </li>
          <li>
            Your item will be shipped to <strong>RepHQ</strong> (Republic Airways HQ, Carmel, IN).
          </li>
          <li>
            Please enter your First Name, Last Name and Email Address during the checkout process. This will
            be compared to an existing list of people approved to order.
          </li>
        </ul>

        <div className="flex flex-col gap-3 sm:flex-row">
          <button
            type="button"
            onClick={() => router.push('/')}
            className="rounded-md border border-gray-300 px-4 py-3 font-medium text-gray-700 hover:bg-gray-50"
          >
            Back
          </button>
          <button
            type="button"
            onClick={() => router.push('/products')}
            className="rounded-md px-4 py-3 font-medium text-white hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-[#c8102e] focus:ring-offset-2 sm:px-8"
            style={{ backgroundColor: '#c8102e' }}
          >
            Continue
          </button>
        </div>
      </div>
    </div>
  )
}
