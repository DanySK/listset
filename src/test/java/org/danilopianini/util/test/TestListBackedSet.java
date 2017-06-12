package org.danilopianini.util.test;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

import java.util.LinkedList;

import org.danilopianini.util.ListBackedSet;
import org.danilopianini.util.ListSet;

public class TestListBackedSet {

    @Test
    public void test() {
        final ListSet<Integer> l = new ListBackedSet<>(new LinkedList<>());
        assertEquals(0, l.size());
        l.add(0);
        assertEquals(1, l.size());
        assertEquals(Integer.valueOf(0), l.get(0));
        l.add(1);
        assertEquals(2, l.size());
        assertEquals(Integer.valueOf(0), l.get(0));
        assertEquals(Integer.valueOf(1), l.get(1));
        l.add(1);
        assertEquals(2, l.size());
        assertEquals(Integer.valueOf(0), l.get(0));
        assertEquals(Integer.valueOf(1), l.get(1));
        l.remove(0);
        assertEquals(1, l.size());
        assertEquals(Integer.valueOf(1), l.get(0));
    }

}
