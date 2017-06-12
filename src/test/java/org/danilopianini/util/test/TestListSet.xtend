package org.danilopianini.util.test

import java.util.LinkedList
import org.danilopianini.util.ImmutableListSet
import org.danilopianini.util.LinkedListSet
import org.danilopianini.util.ListBackedSet
import org.danilopianini.util.ListSet
import org.danilopianini.util.UnmodifiableListSet
import org.junit.Test

import static org.junit.Assert.assertEquals
import static org.junit.Assert.fail

class TestListSet {
	@Test def void testListBackedSet() {
		val ListSet<Integer> l = new ListBackedSet(new LinkedList())
		assertEquals(0, l.size())
		l.add(0)
		assertEquals(1, l.size())
		assertEquals(Integer.valueOf(0), l.get(0))
		l.add(1)
		assertEquals(2, l.size())
		assertEquals(Integer.valueOf(0), l.get(0))
		assertEquals(Integer.valueOf(1), l.get(1))
		l.add(1)
		assertEquals(2, l.size())
		assertEquals(Integer.valueOf(0), l.get(0))
		assertEquals(Integer.valueOf(1), l.get(1))
		l.remove(0)
		assertEquals(1, l.size())
		assertEquals(Integer.valueOf(1), l.get(0))
	}

	@Test def void testUnmodifiableListSet() {
		val base = new LinkedListSet(#[0, 0])
		val unmodifiable = new UnmodifiableListSet(base)
		assertEquals(1, unmodifiable.size)
		try {
			unmodifiable.add(0)
			fail
		} catch (UnsupportedOperationException e) {}
		base.addAll(#[0, 1, 2])
		assertEquals(3, unmodifiable.size)
	}

	@Test def void testImmutableListSet() {
		val immutable = ImmutableListSet.newBuilder.add(0, 1, 1, 2, 2).build
		assertEquals(3, immutable.size)
		try {
			immutable.add(0)
			fail
		} catch (UnsupportedOperationException e) {}
	}
}
