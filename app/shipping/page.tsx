'use client'

import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import ExportOrdersButton from '@/components/ExportOrdersButton'
import HelpIcon from '@/components/HelpIcon'
import { getProductSelection, getShipping, getUserEmail, setShipping } from '@/lib/session'
import { REPHQ } from '@/lib/shipping-locations'
import type { ShippingInfo } from '@/types'

const inputClass =
  'w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-[#c8102e] focus:border-transparent bg-white'

export default function ShippingPage() {
  const router = useRouter()
  const [firstName, setFirstName] = useState('')
  const [lastName, setLastName] = useState('')
  const [email, setEmail] = useState('')
  const [error, setError] = useState('')
  const [ready, setReady] = useState(false)

  useEffect(() => {
    if (!getUserEmail()) {
      router.push('/')
      return
    }
    const product = getProductSelection()
    if (!product?.id || !product.sku) {
      router.push('/products')
      return
    }

    const saved = getShipping()
    const sessionEmail = getUserEmail() || ''
    setFirstName(saved?.firstName ?? '')
    setLastName(saved?.lastName ?? '')
    setEmail(saved?.email || sessionEmail)
    setReady(true)
  }, [router])

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    if (!firstName.trim()) {
      setError('Please enter your first name')
      return
    }
    if (!lastName.trim()) {
      setError('Please enter your last name')
      return
    }
    if (!email.trim() || !email.includes('@')) {
      setError('Please enter a valid email address')
      return
    }

    // Single locked RepHQ destination — no location picker.
    const payload: ShippingInfo = {
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      email: email.trim().toLowerCase(),
      locationId: REPHQ.id,
      locationLabel: REPHQ.label,
      company: REPHQ.company,
      attention: REPHQ.attention,
      address: REPHQ.address,
      address2: REPHQ.address2,
      city: REPHQ.city,
      state: REPHQ.state,
      zip: REPHQ.zip,
      country: REPHQ.country,
    }
    setShipping(payload)
    router.push('/review')
  }

  if (!ready) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-white text-xl">Loading...</div>
      </div>
    )
  }

  return (
    <div className="min-h-screen py-12 px-4 relative">
      <ExportOrdersButton />
      <HelpIcon />
      <div className="max-w-2xl mx-auto relative z-10">
        <div className="bg-white rounded-lg shadow-lg p-8">
          <div className="mb-6 text-center">
            <h1 className="text-3xl font-bold text-gray-900 mb-2">Shipping</h1>
            <p className="text-gray-600">Enter your details — delivery ships to RepHQ</p>
          </div>

          {error && (
            <div className="mb-4 p-4 bg-red-50 border border-red-200 rounded-md text-red-700">{error}</div>
          )}

          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="space-y-4">
              <h2 className="text-xl font-semibold text-gray-900 border-b pb-2">Your Information</h2>

              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label htmlFor="firstName" className="block text-sm font-medium text-gray-700 mb-1">
                    First Name <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    id="firstName"
                    value={firstName}
                    onChange={(e) => {
                      setFirstName(e.target.value)
                      setError('')
                    }}
                    required
                    className={inputClass}
                  />
                </div>
                <div>
                  <label htmlFor="lastName" className="block text-sm font-medium text-gray-700 mb-1">
                    Last Name <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    id="lastName"
                    value={lastName}
                    onChange={(e) => {
                      setLastName(e.target.value)
                      setError('')
                    }}
                    required
                    className={inputClass}
                  />
                </div>
              </div>

              <div>
                <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-1">
                  Email Address <span className="text-red-500">*</span>
                </label>
                <input
                  type="email"
                  id="email"
                  value={email}
                  onChange={(e) => {
                    setEmail(e.target.value)
                    setError('')
                  }}
                  required
                  className={inputClass}
                />
              </div>
            </div>

            <div className="space-y-4 pt-4 border-t">
              <h2 className="text-xl font-semibold text-gray-900 border-b pb-2">Delivery Location</h2>
              <p className="text-sm text-gray-600">
                All MOC gifts ship to the locked RepHQ address below.
              </p>

              <div className="rounded-md border border-[#c8102e] bg-red-50 p-4">
                <p className="font-medium text-gray-900">{REPHQ.company}</p>
                <p className="text-sm text-gray-600">Attn: {REPHQ.attention}</p>
                <p className="text-sm text-gray-600">{REPHQ.address}</p>
                <p className="text-sm text-gray-600">
                  {REPHQ.city}, {REPHQ.state} {REPHQ.zip}
                </p>
              </div>
            </div>

            <div className="mt-8 flex justify-between">
              <button
                type="button"
                onClick={() => router.push('/products')}
                className="px-6 py-2 text-white rounded-md hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-[#c8102e] focus:ring-offset-2 font-medium"
                style={{ backgroundColor: '#c8102e' }}
              >
                ← Back
              </button>
              <button
                type="submit"
                className="px-6 py-2 text-white rounded-md hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-[#c8102e] focus:ring-offset-2 font-medium"
                style={{ backgroundColor: '#c8102e' }}
              >
                Continue to Review →
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}
